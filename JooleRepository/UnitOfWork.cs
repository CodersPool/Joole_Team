using System;
using System.Data.Entity;
using JooleRepository.Repositories;

namespace JooleRepository
{
    public class UnitOfWork : IDisposable
    {
        DbContext Context;
        public ICategoryRepo Category;
        public ISubCategoryRepo SubCategory;
        public IManufactureRepo Manufacture;
        public IProductRepo Product;
        public ITypeOptValueRepo TypeOptValue;
        public ITypeRepo Type;
        public ITypeSpecValueRepo TypeSpecValue;
        public IUserRepo User;


        public UnitOfWork (DbContext context)
        {
            Context = context;
            Category = new CategoryRepo(context);
            SubCategory = new SubCategoryRepo(context);
            Manufacture = new ManufactureRepo(context);
            Product = new ProductRepo(context);
            TypeOptValue = new TypeOptValueRepo(context);
            Type = new TypeRepo(context);
            TypeSpecValue = new TypeSpecValueRepo(context);
            User = new UserRepo(context);
        }

        public void SaveChanges()
        {
            Context.SaveChanges();
        }
        #region IDisposable Support

        private bool _disposedValue; // To detect redundant calls

        protected virtual void Dispose(bool disposing)
        {
            if (!_disposedValue)
            {
                if (disposing)
                {
                    // TODO: dispose managed state (managed objects).
                }

                // TODO: free unmanaged resources (unmanaged objects) and override a finalizer below.
                // TODO: set large fields to null.

                _disposedValue = true;
            }
        }

        // TODO: override a finalizer only if Dispose(bool disposing) above has code to free unmanaged resources.
        // ~DisposeTest() {
        //   // Do not change this code. Put cleanup code in Dispose(bool disposing) above.
        //   Dispose(false);
        // }

        // This code added to correctly implement the disposable pattern.
        public void Dispose()
        {
            // Do not change this code. Put cleanup code in Dispose(bool disposing) above.
            Dispose(true);
            // TODO: uncomment the following line if the finalizer is overridden above.
            // GC.SuppressFinalize(this);
        }

        #endregion

    }
}
